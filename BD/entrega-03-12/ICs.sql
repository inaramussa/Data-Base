DROP TRIGGER IF EXISTS verifica_sub_categorias ON tem_outra;
DROP TRIGGER IF EXISTS verifica_unidades_repostas ON evento_reposicao;
DROP TRIGGER IF EXISTS verifica_reposicao_produto ON evento_reposicao;


--(RI-1) Uma Categoria não pode estar contida em si própria
CREATE OR REPLACE FUNCTION verifica_sub_categorias_trigger_proc() RETURNS TRIGGER AS $$
BEGIN
    IF new.super_categoria = new.categoria
        RAISE EXCEPTION 'Categoria não pode estar contida em si propria';
    END IF;
    RETURN new;
END
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER verifica_sub_categorias BEFORE INSERT OR UPDATE ON tem_outra
FOR EACH ROW EXECUTE PROCEDURE verifica_sub_categorias_trigger_proc();


--(RI-4) O número de unidades repostas num Evento de Reposição não pode exceder o número de unidades especificado no Planograma
CREATE OR REPLACE FUNCTION verifica_unidades_repostas_trigger_proc() RETURNS TRIGGER AS $$
DECLARE unidades_planograma INTEGER := 0;
BEGIN
    SELECT unidades INTO unidades_planograma FROM planograma WHERE ean=new.ean AND nro=new.nro
    AND num_serie=new.num_serie AND fabricante=new.fabricante;
    IF new.unidades > unidades_planograma
        RAISE EXCEPTION 'Número de unidades repostas não pode exceder número de unidades especificado no Planograma';
    END IF;
    RETURN new;
END
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER verifica_unidades_repostas BEFORE INSERT OR UPDATE ON evento_reposicao
FOR EACH ROW EXECUTE PROCEDURE verifica_unidades_respostas_trigger_proc();


--(RI-5) Um Produto só pode ser reposto numa Prateleira que apresente (pelo menos) uma das Categorias desse produto
CREATE OR REPLACE FUNCTION verifica_reposicao_produto_trigger_proc() RETURNS TRIGGER AS $$
DECLARE category VARCHAR(100) := '';
DECLARE shelf_category VARCHAR(100) := '';
BEGIN
    SELECT cat INTO category FROM produto WHERE ean=new.ean;
    SELECT nome INTO shelf_category FROM prateleira WHERE prateleira.nro=new.nro
    AND prateleira.num_serie=new.num_serie AND prateleira.fabricante=new.fabricante;
    IF category!=shelf_category THEN
        IF NOT EXISTS(SELECT * FROM tem_categoria where ean=new.ean and name=shelf_category) THEN
            RAISE EXCEPTION 'Produto so pode ser reposto numa prateleira que apresente pelo menos uma das Categorias desse produto';
        END IF;
    END IF;
    RETURN new;
END
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER verifica_reposicao_produto BEFORE INSERT OR UPDATE ON evento_reposicao
FOR EACH ROW EXECUTE PROCEDURE verifica_reposicao_produto_trigger_proc();
