SET search_path TO polvinho;

DO $$
BEGIN 
	IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'type_status') THEN
		CREATE TYPE type_status AS ENUM ('active', 'inactive');
	END IF;
END $$;

ALTER TABLE users
ADD COLUMN status type_status NOT NULL DEFAULT 'active';

ALTER TABLE users
RENAME COLUMN full_name TO name;

INSERT INTO schema_migrations (version, name_migration) VALUES ('015', 'alter_full_name_to_name_and_add_column_status') ON CONFLICT (version) DO NOTHING;