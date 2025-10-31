# __Sistema de Gestión de Inventarios__

Esta es la versión beta de lo que será el sistema completo. Hasta ahora solo permite registrar e iniciar sesión a los usuarios, pero a futuro tendrá más opciones para registrar productos, proveedores, crear reportes, etc.


## ¿Cómo puedo ejecutar este proyecto?

Lo primero que hay que hacer es tener el motor de base de datos MySQL instalado y que use el puerto 3306.

Una vez se tenga instalado, hay que clonar este repositorio por medio del siguiente comando:

```bash
git clone https://github.com/Selene-bm/SistemaInventario.git
```

Ya que se tiene instalado, se ejecutará el archivo llamado ``sistema_inventario_db.sql`` en la plataforma donde se puedan realizar querys para MySQL (HeidiSQL, MySQLYog). En este archivo se crea la base de datos y las tablas. De momento no hay datos insertados en las tablas.

El siguiente paso es instalar las librerías que se necesitan:

```bash
pip install -r requirements.txt
```

Ya que se tiene todo lo anterior, se puede ejecutar el proyecto mediante:

```bash
python manage.py runserver
```

Este se ejecutará en el localhost y en el puerto 8000 ([http://127.0.0.1:8000/](http://127.0.0.1:8000/)).

Lo primero que se verá al abrir es el index y las opciones que hay.
