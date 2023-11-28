-- Criar a tabela Autores
CREATE TABLE Autores (
    AutorID INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(100),
    Nacionalidade VARCHAR(50)
);

-- Criar a tabela Livros
CREATE TABLE Livros (
    LivroID INT NOT NULL PRIMARY KEY,
    Titulo VARCHAR(100),
    AnoPublicacao INT,
    AutorID INT,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

-- 1. Inserção de dados

-- Inserir autores
INSERT INTO Autores (AutorID, Nome, Nacionalidade) VALUES
(1, 'Autor1', 'Nacionalidade1'),
(2, 'Autor2', 'Nacionalidade2'),
(3, 'Autor3', 'Nacionalidade3');

-- Inserir livros associados aos autores
INSERT INTO Livros (LivroID, Titulo, AnoPublicacao, AutorID) VALUES
(1, 'Livro1', 2020, 1),
(2, 'Livro2', 2018, 2),
(3, 'Livro3', 2015, 3),
(4, 'Livro4', 2019, 1),
(5, 'Livro5', 2021, 2);

-- Consulta simples
SELECT * FROM Autores;
SELECT * FROM Livros;

-- 3. Consulta com junção INNER JOIN: Objetivo de criar duas novas colunas. NomeAutor que recebe 
-- dados do Nome > dentro de Autores e IituloLivro que recebe dados do Titulo > dentro de Livros.
-- Espera-se obter uma relação de NomeAutores e seus respectivos TituloLivros.
SELECT Autores.Nome AS NomeAutor, Livros.Titulo AS TituloLivro
FROM Autores
INNER JOIN Livros ON Autores.AutorID = Livros.AutorID;

-- 4. Consulta com junção LEFT JOIN:  a sintaxe é bastante parecida com a do INNER JOIN
-- porém, no resultado virão todas as linhas da coluna “NomeAutor” com os valores correspondentes 
-- encontrados na coluna “TituloLivro”.
SELECT Autores.Nome AS NomeAutor, Livros.Titulo AS TituloLivro
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID;

-- 5. Consulta com filtro por nacionalidade: nesta consulta, apenas o autor com a nacionalidade1 serão exibidos
SELECT Autores.Nome AS NomeAutor, Livros.Titulo AS TituloLivro
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID
WHERE Autores.Nacionalidade = 'Nacionalidade1';

-- 6. Consulta agregada
SELECT Autores.Nome AS NomeAutor, COUNT(Livros.LivroID) AS QtdLivros
FROM Autores
LEFT JOIN Livros ON Autores.AutorID = Livros.AutorID
GROUP BY Autores.Nome;
