DROP TABLE IF EXISTS evento_reposicao;
DROP TABLE IF EXISTS responsavel_por;
DROP TABLE IF EXISTS retalhista;
DROP TABLE IF EXISTS planograma;
DROP TABLE IF EXISTS prateleira;
DROP TABLE IF EXISTS instalada_em;
DROP TABLE IF EXISTS ponto_de_retalho;
DROP TABLE IF EXISTS IVM;
DROP TABLE IF EXISTS tem_categoria
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS tem_outra;
DROP TABLE IF EXISTS super_categoria;
DROP TABLE IF EXISTS categoria_simples;
DROP TABLE IF EXISTS categoria;


CREATE TABLE categoria (nome VARCHAR(20) NOT NULL,
                        PRIMARY KEY(nome));
                       

CREATE TABLE categoria_simples(nome VARCHAR(20)NOT NULL,
                        PRIMARY KEY(nome),
                        FOREIGN KEY(nome)
                            REFERENCES categoria(nome)ON DELETE CASCADE ON UPDATE CASCADE);
                        

CREATE TABLE super_categoria(nome VARCHAR(20) NOT NULL, 
                        PRIMARY KEY(nome),
                        FOREIGN KEY(nome)
                            REFERENCES categoria ON DELETE CASCADE ON UPDATE CASCADE);
                           

CREATE TABLE tem_outra(super_categoria VARCHAR(20) NOT NULL, categoria VARCHAR(20) NOT NULL, 
                    PRIMARY KEY(categoria),
                    FOREIGN KEY(super_categoria)
                        REFERENCES super_categoria(nome)ON DELETE CASCADE ON UPDATE CASCADE,
                    FOREIGN KEY(categoria)
                        REFERENCES categoria(nome) ON DELETE CASCADE ON UPDATE CASCADE);
                        

CREATE TABLE produto(ean VARCHAR(40) NOT NULL, cat VARCHAR(20) NOT NULL, descr VARCHAR(20) NOT NULL,
                    PRIMARY KEY (ean),
                    FOREIGN KEY(cat)
                        REFERENCES categoria(nome)ON DELETE CASCADE ON UPDATE CASCADE);
                    

CREATE TABLE tem_categoria(ean VARCHAR(40) NOT NULL, nome VARCHAR(20)NOT NULL,
                            FOREIGN KEY(ean)
                            REFERENCES produto(ean)ON DELETE CASCADE ON UPDATE CASCADE,
                            FOREIGN KEY (nome)
                                REFERENCES categoria(nome)ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE IVM(num_serie REAL NOT NULL, fabricante VARCHAR(20) NOT NULL,
                            PRIMARY KEY(num_serie,fabricante));
                            

CREATE TABLE ponto_de_retalho(nome VARCHAR(20) NOT NULL, distrito VARCHAR(20) NOT NULL, concelho VARCHAR(20) NOT NULL,
                                PRIMARY KEY(nome));
                                   
CREATE TABLE instalada_em(num_serie REAL NOT NULL, fabricante VARCHAR(30) NOT NULL, local VARCHAR(30) NOT NULL,
                                PRIMARY KEY(num_serie, fabricante),
                                    FOREIGN KEY(num_serie,fabricante)
                                        REFERENCES IVM(num_serie,fabricante) ON DELETE CASCADE ON UPDATE CASCADE,
                                    FOREIGN KEY(local)
                                        REFERENCES ponto_de_retalho(nome) ON DELETE CASCADE ON UPDATE CASCADE); --NOME OU DISTRITO?

CREATE TABLE prateleira(nro INTEGER NOT NULL, num_serie REAL NOT NULL, fabricante VARCHAR(30) NOT NULL, altura DECIMAL NOT NULL, nome VARCHAR(20) NOT NULL,
                        PRIMARY KEY(nro, num_serie, fabricante),
                            FOREIGN KEY(num_serie, fabricante)
                                REFERENCES IVM(num_serie, fabricante)ON DELETE CASCADE ON UPDATE CASCADE,
                            FOREIGN KEY (nome)
                                REFERENCES categoria(nome) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE planograma(ean VARCHAR(40) NOT NULL,nro INTEGER NOT NULL,num_serie REAL NOT NULL,fabricante VARCHAR(30) NOT NULL,faces INTEGER NOT NULL,unidades INTEGER NOT NULL,loc VARCHAR(20) NOT NULL,
                        PRIMARY KEY(ean,nro,num_serie,fabricante),
                            FOREIGN KEY(ean)
                                REFERENCES produto(ean)ON DELETE CASCADE ON UPDATE CASCADE,
                            FOREIGN KEY(nro,num_serie,fabricante)
                                REFERENCES prateleira(nro,num_serie,fabricante)ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE retalhista(tin INTEGER NOT NULL, nome VARCHAR(20) NOT NULL,
                        PRIMARY KEY(tin),
                        UNIQUE(nome));

CREATE TABLE responsavel_por(nome_cat VARCHAR(30) NOT NULL, tin INTEGER NOT NULL, num_serie REAL NOT NULL, fabricante VARCHAR(30) NOT NULL,
                            PRIMARY KEY(num_serie,fabricante),
                                FOREIGN KEY(num_serie,fabricante)
                                    REFERENCES IVM(num_serie,fabricante)ON DELETE CASCADE ON UPDATE CASCADE,
                                FOREIGN KEY(tin)
                                    REFERENCES retalhista(tin)ON DELETE CASCADE ON UPDATE CASCADE,
                                FOREIGN KEY(nome_cat)
                                    REFERENCES categoria(nome)ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE evento_reposicao(ean VARCHAR(40) NOT NULL, nro INTEGER NOT NULL,num_serie REAL NOT NULL,fabricante VARCHAR(30) NOT NULL,instante TIMESTAMP not NULL,unidades INTEGER NOT NULL,tin INTEGER NOT NULL,
                                PRIMARY KEY(ean,nro,num_serie,fabricante,instante),
                                    FOREIGN KEY(ean,nro,num_serie,fabricante)
                                        REFERENCES planograma(ean,nro,num_serie,fabricante)ON DELETE CASCADE ON UPDATE CASCADE,
                                    FOREIGN KEY(tin)
                                        REFERENCES retalhista(tin));