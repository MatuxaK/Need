-- Таблица ученых
CREATE TABLE Scientists (
    scientist_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    organization VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    academic_degree VARCHAR(50) NOT NULL
);

-- Таблица конференций
CREATE TABLE Conferences (
    conference_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    date DATE NOT NULL
);

-- Таблица типов участников
CREATE TABLE ParticipantTypes (
    type_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Таблица участия ученых в конференциях
CREATE TABLE ConferenceParticipants (
    participation_id INT PRIMARY KEY,
    scientist_id INT NOT NULL,
    conference_id INT NOT NULL,
    type_id INT NOT NULL,
    presentation_topic VARCHAR(200) NOT NULL,
    is_published Bit NOT NULL,
    FOREIGN KEY (scientist_id) REFERENCES Scientists(scientist_id),
    FOREIGN KEY (conference_id) REFERENCES Conferences(conference_id),
    FOREIGN KEY (type_id) REFERENCES ParticipantTypes(type_id)
);
