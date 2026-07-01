SET search_path TO polvinho;

CREATE TABLE courses(
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	id_department UUID REFERENCES departments(id) NOT NULL,
	created_by UUID REFERENCES users(id) NOT NULL,
	title VARCHAR(100) NOT NULL,
	entity_code char(9) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO schema_migrations (version, name_migration) VALUES ('004', 'create_course') ON CONFLICT (version) DO NOTHING;