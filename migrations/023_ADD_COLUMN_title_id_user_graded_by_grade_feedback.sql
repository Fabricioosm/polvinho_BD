SET search_path TO polvinho;

ALTER TABLE submissions
ADD COLUMN title VARCHAR(100) NOT NULL;

ALTER TABLE submissions
ADD COLUMN id_user UUID;

ALTER TABLE submissions
ADD CONSTRAINT submissions_id_users_fkey FOREIGN KEY (id_user) REFERENCES users(id);

ALTER TABLE submissions
ADD COLUMN graded_by UUID;

ALTER TABLE submissions
ADD CONSTRAINT submissions_graded_by_fkey FOREIGN KEY (graded_by) REFERENCES users(id);

ALTER TABLE submissions
ADD COLUMN grade NUMERIC NULL;

ALTER TABLE submissions
ADD COLUMN feedback TEXT NULL;

INSERT INTO schema_migrations (version, name_migration) VALUES ('023', 'ADD_COLUMN_title_id_user_graded_by_grade_feedback') ON CONFLICT (version) DO NOTHING;

