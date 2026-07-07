SET search_path TO polvinho;

DO $$
BEGIN
	IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'type_status') THEN 
		CREATE TYPE type_status AS ENUM ('active', 'inactive');
	END IF;
END $$;

ALTER TABLE users_subjects
ADD COLUMN status type_status NOT NULL;

ALTER TABLE users_subjects
DROP CONSTRAINT users_subjects_id_course_fkey;

ALTER TABLE users_subjects
ADD CONSTRAINT users_subjects_id_subject_fkey FOREIGN KEY (id_course) REFERENCES subjects(id);

ALTER TABLE users_subjects
RENAME COLUMN id_course TO id_subject;

INSERT INTO schema_migrations (version, name_migration) VALUES ('021', 'add_column_status_users_subjects_and_alter_name_id_course_to_id_subject') ON CONFLICT (version) DO NOTHING;