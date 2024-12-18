A Q&A Community Platform, where knowledge flows freely. This website is your place for asking questions, sharing expertise, and connecting with people who share your interests.
Join a community committed to learning and collaboration.

Entities and Their Roles:

1) USER

Role: Represents the participants of the platform.
Responsibilities:
- Ask questions.
- Provide answers to questions.
- Leave comments on answers.
- Maintain their profile (name, email, bio, reputation, etc.).
- Track user status (e.g., role and account status).

2) QUESTION

Role: Represents the core content users create to seek information.
Responsibilities:
- Allow users to post questions with content, titles.
- Track which user posted the question.
- Categorize questions for better organization.

3) ANSWER

Role: Represents solutions or responses provided by users to specific questions.
Responsibilities:
- Allow users to answer questions.
- Track acceptance status (is_accepted).
- Maintain answer content, date_posted and updated_date.
- Enable users to interact by commenting on answers.

4) COMMENT

Role: Allows users to add feedback, clarification or additional insights.
Responsibilities:
- Facilitate interaction by enabling users to comment on answers.
- Track comment content and the creation_date.

5) CATEGORY

Role: Organize questions by topics or subjects.
Responsibilities:
- Allow classification of questions for better search and navigation.
- Provide a description for each category.


Relationships:

1) USER

- Can create multiple questions.
- Can provide multiple answers.
- Can write multiple comments.

2) QUESTION

- Must be created by a user.
- Can have multiple answers.
- A question must belong to a category.

3) ANSWER

- Must be provided by a user.
- Must belong to a question.
- Can have multiple comments.

4) COMMENT

- Must be made by a user.
- Must have an answer.

5) CATEGORY

- A category may have many questions.

