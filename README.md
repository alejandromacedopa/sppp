# SPPP

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![NestJS](https://img.shields.io/badge/NestJS-E0234E?style=for-the-badge&logo=nestjs&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

SPPP es una aplicación móvil desarrollada en **Flutter** y **Dart** que consume APIs creadas con **NestJS** y utiliza una base de datos **MySQL**. El proyecto tiene como objetivo facilitar el seguimiento y gestión de prácticas profesionales, permitiendo la gestión de usuarios, registros de entradas y salidas, generación de reportes, y más.

## Características

- 📱 **Flutter y Dart**: Desarrollo móvil multiplataforma para Android e iOS.
- 🌐 **APIs con NestJS**: Backend robusto para manejar las funcionalidades de la app.
- 🗄️ **MySQL**: Gestión y almacenamiento de datos eficiente.
- 🔒 **Autenticación y Autorización**: Control de acceso seguro para diferentes tipos de usuarios.
- 📊 **Reportes de Prácticas**: Generación de reportes detallados sobre las horas y actividades de las prácticas.
- 📝 **Cuestionarios de Evaluación**: Herramienta integrada para la evaluación de los practicantes.

## Tecnologías Utilizadas

- **Frontend**: Flutter, Dart
- **Backend**: NestJS (TypeScript)
- **Base de Datos**: MySQL

## Instalación

### Requisitos Previos

- Flutter SDK [Instalar](https://docs.flutter.dev/get-started/install)
- Node.js y npm [Instalar](https://nodejs.org/)
- MySQL [Instalar](https://dev.mysql.com/downloads/)

### Instrucciones

1. Clonar el repositorio:
    ```bash
    git clone https://github.com/alejandromacedopa/sppp.git
    ```
2. Configurar la base de datos en MySQL y ajustar las credenciales en los archivos de configuración correspondientes.
3. Instalar las dependencias de Flutter:
    ```bash
    cd sppp/frontend
    flutter pub get
    ```
4. Instalar las dependencias de NestJS:
    ```bash
    cd sppp/backend
    npm install
    ```
5. Iniciar la aplicación:
    - **Frontend**: 
        ```bash
        cd sppp/frontend
        flutter run
        ```
    - **Backend**: 
        ```bash
        cd sppp/backend
        npm run start
        ```

## Contribuir

¡Contribuciones son bienvenidas! Por favor sigue el flujo de trabajo estándar de [fork & pull request](https://guides.github.com/activities/forking/).

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Para más detalles, revisa el archivo `LICENSE`.
