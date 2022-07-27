-- ### Questão 1: Utilizando uma *query*, 
-- obtenha todos os usuários (`users`) que vivem na cidade (`cities`) cujo nome seja “**Rio de Janeiro**”.
SELECT * FROM users;
SELECT * FROM cities;
SELECT users.id AS id,users.name AS name, cities.name AS city
FROM users 
INNER JOIN cities ON cities.id=users."cityId"
WHERE cities.name='Rio de Janeiro';

-- ### Questão 2:Utilizando umas *query*, 
-- obtenha todos os depoimentos (`testimonials`) cadastrados, incluindo o nome do remetente e do destinatário.
SELECT testimonials.id, writer.name As writer, recipient.name As recipient, testimonials.message FROM testimonials
JOIN users writer on writer.id = testimonials."writerId"
JOIN users recipient on recipient.id = testimonials."recipientId";

-- ### Questão 3:Utilizando uma *query*, 
-- obtenha todos os cursos (`courses`) que o usuário com id **30** já finalizou,
-- incluindo o nome da escola. 
-- O que indica que um usuário terminou um curso é o campo `status` da tabela `educations`,
-- que deve estar como "**finished**".

SELECT users.id,users.name, courses.name as course, schools.name as school, educations."endDate" as "endDate"  FROM users
JOIN educations on educations."userId" =users.id and users.id=30
JOIN courses on courses.id=educations."courseId"
JOIN schools on schools.id =educations."schoolId";

-- ### Questão 4: Utilizando uma *query*, 
-- obtenha as empresas (`companies`) para as quais o usuário com id **50** trabalha atualmente.
--  Para filtrar quem trabalha atualmente, utilize o campo `endDate` da tabela `experiences`. Se ele estiver null (`IS NULL`), significa que a pessoa ainda não encerrou a experiência dela na empresa, ou seja, está trabalhando lá.
SELECT users.id, users.name, roles.name, companies.name, experiences."startDate",experiences."endDate" FROM users
JOIN experiences on experiences."userId"=users.id and users.id=50 and experiences."endDate" IS NULL
JOIN companies on companies.id=experiences."companyId"
JOIN roles on roles.id = experiences."roleId";
 