Requerimientos Técnicos
1- Servidor Sql Server 2005 o superior donde montar la base de datos.
2- PC conectada en red al servidor donde ejecutar el sistema.

La Pc requiere .NET Framework 4.

Muy importante junto al ejecutable siempre va un archivo de extencion .config,
ahi se guarda informacion en xml, o sea la ConnectionString, que es la cadena
de coneccion del servidor Sql Server, esto:

<connectionStrings>
        <add name="EmailAdmin.Properties.Settings.CorreoConnectionString1"
            connectionString="Data Source=localhost;Initial Catalog=Correo;Integrated Security=True"
            providerName="System.Data.SqlClient" />
</connectionStrings>




