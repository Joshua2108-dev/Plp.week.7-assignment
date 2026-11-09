Initial creation of core application tables

CREATE TABLE IF NOT EXISTS students (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name TEXT NOT NULL,
created_at TIMESTAMPTZ DEFAULT now()
);

-- Seed sample data for testing
INSERT INTO students (name) VALUES
('Alice Johnson'),
('Bob Smith'),
('Charlie Davis');