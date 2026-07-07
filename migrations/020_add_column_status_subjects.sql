SET search_path TO polvinho;

DO $$
BEGIN
	IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'type_status') THEN 
		CREATE TYPE type_status AS ENUM ('active', 'inactive');
	END IF;
END $$;

ALTER TABLE subjects
ADD COLUMN status type_status NOT NULL;

INSERT INTO schema_migrations (version, name_migration) VALUES ('020', 'add_column_status_subjects') ON CONFLICT (version) DO NOTHING;