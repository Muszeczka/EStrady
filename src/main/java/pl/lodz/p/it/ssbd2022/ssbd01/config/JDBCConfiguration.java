package pl.lodz.p.it.ssbd2022.ssbd01.config;

import javax.annotation.sql.DataSourceDefinition;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Connection;

// Ta pula połączeń jest na potrzeby tworzenia struktur przy wdrażaniu aplikacji
@DataSourceDefinition(
        name = "java:app/jdbc/ssbd01admin",
        className = "org.postgresql.ds.PGSimpleDataSource",
        user = "ssbd01admin",
        password = "admin",
//        serverName = "studdev.it.p.lodz.pl",
        serverName = "127.0.0.1",
        portNumber = 5432,
        databaseName = "ssbd01",
        initialPoolSize = 1,
        minPoolSize = 0,
        maxPoolSize = 1,
        maxIdleTime = 10
)

// Ta pula połączeń jest na potrzeby implementacji uwierzytelniania w aplikacji
@DataSourceDefinition(
        name = "java:app/jdbc/ssbd01auth",
        className = "org.postgresql.ds.PGSimpleDataSource",
        user = "ssbd01auth",
        password = "auth",
//        serverName = "studdev.it.p.lodz.pl",
        serverName = "127.0.0.1",
        portNumber = 5432,
        databaseName = "ssbd01"
)

// Ta pula połączeń jest na potrzeby operacji realizowanych przez moduł obsługi konta w aplikacji
@DataSourceDefinition(
        name = "java:app/jdbc/ssbd01mok",
        className = "org.postgresql.ds.PGSimpleDataSource",
        user = "ssbd01mok",
        password = "mok",
//        serverName = "studdev.it.p.lodz.pl",
        serverName = "127.0.0.1",
        portNumber = 5432,
        databaseName = "ssbd01",
        transactional = true,
        isolationLevel = Connection.TRANSACTION_READ_COMMITTED
)

// Ta pula połączeń jest na potrzeby operacji realizowanych przez moduł ogłoszeń w aplikacji
@DataSourceDefinition(
        name = "java:app/jdbc/ssbd01mo",
        className = "org.postgresql.ds.PGSimpleDataSource",
        user = "ssbd01mo",
        password = "mo",
//        serverName = "studdev.it.p.lodz.pl",
        serverName = "127.0.0.1",
        portNumber = 5432,
        databaseName = "ssbd01",
        transactional = true,
        isolationLevel = Connection.TRANSACTION_READ_COMMITTED
)

// Ta pula połączeń jest na potrzeby operacji realizowanych przez moduł zgłaszającego w aplikacji
@DataSourceDefinition(
        name = "java:app/jdbc/ssbd01mz",
        className = "org.postgresql.ds.PGSimpleDataSource",
        user = "ssbd01mz",
        password = "mz",
//        serverName = "studdev.it.p.lodz.pl",
        serverName = "127.0.0.1",
        portNumber = 5432,
        databaseName = "ssbd01",
        transactional = true,
        isolationLevel = Connection.TRANSACTION_READ_COMMITTED
)

// Ta pula połączeń jest na potrzeby operacji realizowanych przez moduł wynajmującego w aplikacji
@DataSourceDefinition(
        name = "java:app/jdbc/ssbd01mw",
        className = "org.postgresql.ds.PGSimpleDataSource",
        user = "ssbd01mw",
        password = "mw",
//        serverName = "studdev.it.p.lodz.pl",
        serverName = "127.0.0.1",
        portNumber = 5432,
        databaseName = "ssbd01",
        transactional = true,
        isolationLevel = Connection.TRANSACTION_READ_COMMITTED
)

@Stateless
public class JDBCConfiguration {

    @PersistenceContext(unitName = "ssbd01adminPU")
    private EntityManager entityManager;
}
