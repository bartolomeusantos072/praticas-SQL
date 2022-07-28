-- ### Questão 1: Utilizando uma *query*, 
-- obtenha a quantidade de experiências (`experiences`) atuais, ou seja,
-- com `“endDate”` diferente de `NULL`. 

SELECT COUNT("roleId") as "currentExperiences"
FROM experiences 
WHERE experiences."endDate" IS NOT NULL
GROUP BY experiences."roleId";

-- Utilizando uma query, obtenha 
-- a quantidade de graduações (educations) por usuário, incluindo o seu id.
SELECT "userId", COUNT("courseId") as educations 
FROM educations
GROUP BY educations."userId"
ORDER BY "userId" ASC;

-- Utilizando uma query, obtenha 
-- a quantidade de depoimentos(testimonials) que o usuário com id 435 efetuou, incluindo o seu nome.

SELECT users.name AS writer, COUNT(testimonials."writerId") AS testimonailCount FROM testimonials
JOIN users on users.id=testimonials."writerId" and users.id=435 
GROUP BY users.name;

-- ### Questão 4:Utilizando uma *query*, 
-- obtenha o maior salário das vagas (`jobs`) ativas (**`active** = true`) 
-- e o nome das posições (`roles`) dessas vagas ordenadas de forma ascendente

SELECT MAX(salary) AS "maximumSalary", roles.name AS "role"
FROM jobs 
JOIN roles ON roles.id=jobs."roleId" and jobs.active=true
GROUP BY roles.name
ORDER BY roles.name ASC;

-- ### Desafio Bônus
-- Utilizando uma *query*, obtenha 
-- os **3** cursos (`courses`) e escolas (`schools`) 
-- com a **maior** quantidade de alunos (`educations`) 
-- que estão cursando (`status='ongoing'` ) ou finalizaram (`status='finished'`)

SELECT schools.name AS school, courses.name AS cousers, COUNT("userId") as studentsCount, educations.status AS role  
FROM educations
JOIN schools on schools.id=educations."userId" AND educations.status!='time off'
JOIN courses on courses.id=educations."courseId"
GROUP BY educations."userId", courses.name, schools.name, educations.status
ORDER BY educations."userId" ASC LIMIT 3;
