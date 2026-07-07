SET search_path TO polvinho;

DO $$
BEGIN
	IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'type_status') THEN 
		CREATE TYPE type_status AS ENUM ('active', 'inactive');
	END IF;
END $$;

ALTER TABLE departments
ADD COLUMN status type_status NOT NULL;

INSERT INTO schema_migrations (version, name_migration) VALUES ('016', 'add_column_status') ON CONFLICT (version) DO NOTHING;