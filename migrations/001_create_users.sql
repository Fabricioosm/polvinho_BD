SET search_path TO polvinho;

DO $$
BEGIN
	IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'type_roles') THEN
		CREATE TYPE type_roles AS ENUM ('admin', 'coordinator', 'professor', 'student');
	END IF;
END $$;

CREATE TABLE users(
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	full_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	cpf CHAR(11) UNIQUE NOT NULL,
	birth_date DATE NOT NULL,
	registration CHAR(10) UNIQUE NOT NULL,
	role type_roles NOT NULL,
	first_access TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	password VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO schema_migrations (version, name_migration) VALUES ('001', 'create_users') ON CONFLICT (version) DO NOTHING;