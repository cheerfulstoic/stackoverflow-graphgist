Top askers:

MATCH (u:StackOverflowUser)-[:owns_question]-(q:StackOverflowQuestion) RETURN u.display_name, count(q) ORDER BY count(q) DESC


Top answerers:

MATCH (u:StackOverflowUser)-[:owns_answer]-(a:StackOverflowAnswer) RETURN u.display_name, count(a) ORDER BY count(a) DESC


How many times one user has answered the same user's question:

MATCH (answerer:StackOverflowUser)-[:owns_answer]->(a:StackOverflowAnswer)-[:answers_question]->(q:StackOverflowQuestion)<-[:owns_question]-(asker:StackOverflowUser) RETURN answerer.display_name, asker.display_name, count(q) ORDER BY count(q) DESC



Number of timse two users have answered the same question:

MATCH (user1:StackOverflowUser)-[:owns_answer]->(:StackOverflowAnswer)-[:answers_question]->(q:StackOverflowQuestion)<-[:answers_question]-(:StackOverflowAnswer)<-[:owns_answer]-(user2:StackOverflowUser)
WHERE ID(user1) < ID(user2)
RETURN user1.display_name, user2.display_name, count(q)
ORDER BY count(q) DESC



Tag recommendation:
MATCH (question:StackOverflowQuestion)-[:has_tag]->(tag:StackOverflowTag)
WHERE tag.text IN ['neo4j', 'javascript']
WITH question, count(tag) AS count WHERE count = 2 WITH question
MATCH question-[:has_tag]->(tag:StackOverflowTag)
WHERE NOT(tag.text IN ['neo4j', 'javascript'])
RETURN tag.text, COUNT(tag) ORDER BY COUNT(tag) DESC




For how many questions has the asker answered their own question?

MATCH (question:StackOverflowQuestion)<-[:owns_question]-(user:StackOverflowUser), question<-[:answers_question]-(:StackOverflowAnswer)<-[:owns_answer]-user RETURN count(question)

How many times have people answered their own question?

MATCH (question:StackOverflowQuestion)<-[:owns_question]-(user:StackOverflowUser), question<-[:answers_question]-(:StackOverflowAnswer)<-[:owns_answer]-user RETURN user.display_name, count(question) ORDER BY count(question) DESC






MATCH (user1:StackOverflowUser)-[:owns_answer]->(:StackOverflowAnswer)-[:answers_question]->(:StackOverflowQuestion)-[:has_tag]->(tag:StackOverflowTag)<-[:has_tag]-(:StackOverflowQuestion)<-[:answers_question]-(:StackOverflowAnswer)<-[:owns_answer]-(user2:StackOverflowUser)
WHERE ID(user1) < ID(user2)
WITH tag.text AS tag, user1.display_name AS user1, user2.display_name AS user2, count(tag) AS count
ORDER BY count DESC
WITH tag, collect([user1, user2, count])[0..3] AS collection
UNWIND collection AS row
RETURN tag, row[0], row[1], row[2]
LIMIT 150





Not useful?:

Number of tags user has answered

MATCH (user:StackOverflowUser)-[:owns_answer]->(:StackOverflowAnswer)-[:answers_question]->(:StackOverflowQuestion)-[:has_tag]->(tag:StackOverflowTag)
RETURN user.display_name, count(DISTINCT tag)
ORDER BY count(DISTINCT tag) DESC

Number of tags per question

MATCH (user:StackOverflowUser)-[:owns_answer]->(:StackOverflowAnswer)-[:answers_question]->(question:StackOverflowQuestion)-[:has_tag]->(tag:StackOverflowTag)
RETURN user.display_name, toFloat(count(DISTINCT tag)) / toFloat(count(question))


