GRANT SELECT, UPDATE on SEQUENCE account_id_seq to ssbd01mok;
GRANT SELECT, UPDATE on SEQUENCE verification_token_id_seq to ssbd01mok;
GRANT SELECT, UPDATE on SEQUENCE access_level_id_seq to ssbd01mok;
GRANT SELECT, UPDATE on SEQUENCE offer_id_seq to ssbd01mz;
GRANT SELECT, UPDATE on SEQUENCE offer_date_id_seq to ssbd01mw;
GRANT SELECT, UPDATE on SEQUENCE user_offer_id_seq to ssbd01mw;
GRANT SELECT, UPDATE on SEQUENCE rate_id_seq to ssbd01mw;
GRANT SELECT, UPDATE on SEQUENCE rate_id_seq to ssbd01mok;


GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Account TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Account TO ssbd01admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Account TO ssbd01mok;
GRANT SELECT ON TABLE Account TO ssbd01auth;
GRANT SELECT ON TABLE Account TO ssbd01mo;
GRANT SELECT ON TABLE Account TO ssbd01mz;
GRANT SELECT ON TABLE Account TO ssbd01mw;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Verification_token TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Verification_token TO ssbd01admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Verification_token TO ssbd01mok;
GRANT SELECT ON TABLE Verification_token TO ssbd01auth;
GRANT SELECT ON TABLE Verification_token TO ssbd01mo;
GRANT SELECT ON TABLE Verification_token TO ssbd01mz;
GRANT SELECT ON TABLE Verification_token TO ssbd01mw;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Access_level TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Access_level TO ssbd01admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Access_level TO ssbd01mok;
GRANT SELECT ON TABLE Access_level TO ssbd01auth;
GRANT SELECT ON TABLE Access_level TO ssbd01mo;
GRANT SELECT ON TABLE Access_level TO ssbd01mz;
GRANT SELECT ON TABLE Access_level TO ssbd01mw;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Admin_details TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Admin_details TO ssbd01admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Admin_details TO ssbd01mok;
GRANT SELECT ON TABLE Admin_details TO ssbd01auth;
GRANT SELECT ON TABLE Admin_details TO ssbd01mo;
GRANT SELECT ON TABLE Admin_details TO ssbd01mz;
GRANT SELECT ON TABLE Admin_details TO ssbd01mw;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Renter_details TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Renter_details TO ssbd01admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Renter_details TO ssbd01mok;
GRANT SELECT ON TABLE Renter_details TO ssbd01auth;
GRANT SELECT ON TABLE Renter_details TO ssbd01mo;
GRANT SELECT ON TABLE Renter_details TO ssbd01mz;
GRANT SELECT ON TABLE Renter_details TO ssbd01mw;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Service_provider_details TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Service_provider_details TO ssbd01admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Service_provider_details TO ssbd01mok;
GRANT SELECT ON TABLE Service_provider_details TO ssbd01auth;
GRANT SELECT ON TABLE Service_provider_details TO ssbd01mo;
GRANT SELECT ON TABLE Service_provider_details TO ssbd01mz;
GRANT SELECT ON TABLE Service_provider_details TO ssbd01mw;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Offer TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Offer TO ssbd01admin;
GRANT SELECT ON TABLE Offer TO ssbd01mok;
GRANT SELECT ON TABLE Offer TO ssbd01mo;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Offer TO ssbd01mz;
GRANT SELECT ON TABLE Offer TO ssbd01mw;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Offer_date TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Offer_date TO ssbd01admin;
GRANT SELECT ON TABLE Offer_date TO ssbd01mok;
GRANT SELECT ON TABLE Offer_date TO ssbd01mo;
GRANT SELECT ON TABLE Offer_date TO ssbd01mz;
GRANT SELECT, INSERT ON TABLE Offer_date TO ssbd01mw;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE User_offer TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE User_offer TO ssbd01admin;
GRANT SELECT ON TABLE User_offer TO ssbd01mok;
GRANT SELECT ON TABLE User_offer TO ssbd01mo;
GRANT SELECT ON TABLE User_offer TO ssbd01mz;
GRANT SELECT, INSERT ON TABLE User_offer TO ssbd01mw;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Rate_renter_details TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Rate_renter_details TO ssbd01admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Rate_renter_details TO ssbd01mok;
GRANT SELECT ON TABLE Rate_renter_details TO ssbd01auth;
GRANT SELECT ON TABLE Rate_renter_details TO ssbd01mo;
GRANT SELECT ON TABLE Rate_renter_details TO ssbd01mz;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Rate_renter_details TO ssbd01mw;

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Rate TO ssbd01;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Rate TO ssbd01admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Rate TO ssbd01mok;
GRANT SELECT ON TABLE Rate TO ssbd01auth;
GRANT SELECT ON TABLE Rate TO ssbd01mo;
GRANT SELECT ON TABLE Rate TO ssbd01mz;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Rate TO ssbd01mw;

-- (Verification_token)
CREATE INDEX verification_token_account_fk ON Verification_token USING btree (account_id);

-- (Access_level)
CREATE INDEX access_level_account_fk ON Access_level USING btree (account_id);

-- (Offer)
CREATE INDEX offer_service_provider_fk ON Offer USING btree (service_provider_id);

-- (Offer_date)
CREATE INDEX offer_date_offer_fk ON Offer_date USING btree (offer_id);

-- (User_offer)
CREATE INDEX user_offer_renter_fk ON User_offer USING btree (renter_id);
CREATE INDEX user_offer_offer_date_fk ON User_offer USING btree (offer_date_id);

-- (Rate)
-- CREATE INDEX rate_renter_fk ON Rate USING btree (renter_id);
-- CREATE INDEX rate_service_provider_fk ON Rate USING btree (service_provider_id);

-- HASŁO dla wszystkich użytkowników: ssbd01

-- Tworzenie konta Administratora
INSERT INTO Account(id, login, password, name, surname, email, phone_number, confirmed, active, version) VALUES(nextval('account_id_seq'), 'admin', '67e357d90262fd9f6dccdb11d18955204b8c02d12574befe45e0d6d0546b7377', 'Ssbdadmin', 'Ssbd', 'ssbd01admin@ias.pl', '111111111', true, true, 1);

INSERT INTO Access_level(id, access_level, active, account_id, version) VALUES(nextval('access_level_id_seq'), 'Admin', true, 1, 1);

INSERT INTO Admin_details(id) VALUES(1);

-- Tworzenie kotna Service providera
INSERT INTO Account(id, login, password, name, surname, email, phone_number, confirmed, active, version) VALUES(nextval('account_id_seq'), 'serviceProvider', '67e357d90262fd9f6dccdb11d18955204b8c02d12574befe45e0d6d0546b7377', 'Ssbdserviceprovider', 'Ssbd', 'ssbd01serviceprovider@ias.pl', '222222222', true, true, 1);

INSERT INTO Access_level(id, access_level, active, account_id, version) VALUES(nextval('access_level_id_seq'), 'ServiceProvider', true, 2, 1);

INSERT INTO Service_provider_details(id, service_name, NIP, address, description, logo_url) VALUES(2, 'service', '0123456789', 'New York', 'Best services', 'url123');

INSERT INTO Rate(id, average_rate, rates_number, version, service_provider_id) VALUES(nextval('rate_id_seq'), 0, 0, 1, 2);

-- Dodanie oferty
INSERT INTO Offer(id, title, description, price, active, service_provider_id, version) VALUES(nextval('offer_id_seq'), 'Tytul1', 'Opis oferty', 100, true, 2, 1);

INSERT INTO Offer(id, title, description, price, active, service_provider_id, version) VALUES(nextval('offer_id_seq'), 'Tytul2', 'Oferta 2', 200, true, 2, 1);

INSERT INTO Offer(id, title, description, price, active, service_provider_id, version) VALUES(nextval('offer_id_seq'), 'Tytul3', 'Oferta 3', 350, true, 2, 1);

INSERT INTO Offer(id, title, description, price, active, service_provider_id, version) VALUES(nextval('offer_id_seq'), 'Tytul4', 'Oferta 4', 520, true, 2, 1);

-- Tworzenie konta Rentera
INSERT INTO Account(id, login, password, name, surname, email, phone_number, confirmed, active, version) VALUES(nextval('account_id_seq'), 'renter', '67e357d90262fd9f6dccdb11d18955204b8c02d12574befe45e0d6d0546b7377', 'Ssbdrenter', 'Ssbd', 'ssbd01renter@ias.pl', '333333333', true, true, 1);

INSERT INTO Access_level(id, access_level, active, account_id, version) VALUES(nextval('access_level_id_seq'), 'Renter', true, 3, 1);

INSERT INTO Renter_details(id, user_name) VALUES(3, 'renter1');

INSERT INTO Offer_date(id, date, version, offer_id) VALUES(nextval('offer_date_id_seq'), '2020-03-21', 1, 1);

INSERT INTO User_offer(id, version, renter_id, offer_date_id) VALUES(nextval('user_offer_id_seq'), 1, 3, 1);

-- Tworzenie konta Rentera
INSERT INTO Account(id, login, password, name, surname, email, phone_number, confirmed, active, version) VALUES(nextval('account_id_seq'), 'renter2', '67e357d90262fd9f6dccdb11d18955204b8c02d12574befe45e0d6d0546b7377', 'Ssbdrenter', 'Ssbd', 'ssbd01renter2@ias.pl', '333333333', true, true, 1);

INSERT INTO Access_level(id, access_level, active, account_id, version) VALUES(nextval('access_level_id_seq'), 'Renter', true, 4, 1);

INSERT INTO Renter_details(id, user_name) VALUES(4, 'renter2');


-- Tworzenie konta Rentera
INSERT INTO Account(id, login, password, name, surname, email, phone_number, confirmed, active, version) VALUES(nextval('account_id_seq'), 'renter3', '67e357d90262fd9f6dccdb11d18955204b8c02d12574befe45e0d6d0546b7377', 'Ssbdrenter', 'Ssbd', 'ssbd01renter3@ias.pl', '333333333', true, true, 1);

INSERT INTO Access_level(id, access_level, active, account_id, version) VALUES(nextval('access_level_id_seq'), 'Renter', true, 5, 1);

INSERT INTO Renter_details(id, user_name) VALUES(5, 'renter3');

