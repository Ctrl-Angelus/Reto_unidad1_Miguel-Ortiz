<div align="center">
    <img src="images/Portada_README.png" alt="Portada Repositorio">
</div>

----
# Reto 1 - Máster IA y Data Science
Para este primer reto del curso, se nos pidió actuar como Data Analyst Juniors en una empresa real, construyendo un pipeline de datos a partir de un dataset que se nos proporcionó, creando un entorno profesional con python y Anaconda, así como hacer uso de la librería Numpy para álgebra lineal, Sqlite3 para exploración de datos y Pandas para transformaciones.

### Contexto del ejercicio
La empresa es TechVentas S.A.S., una distribuidora de tecnología en Latinoamérica. El CEO acaba de pedir un análisis del primer semestre. El problema: el archivo que dejó el equipo anterior tiene
errores — productos en blanco, cantidades negativas y campos vacíos. Aplicar un flujo de proyecto de datos, documentar y explicar las decisiones tomadas. En el documento `Reto 1 Descripción.pdf` se explica todo de forma detallada.

## ¿Cómo se compone el proyecto y cómo ejecutarlo?
1. En el archivo `setup.md` se muestran los pasos para crear el entorno virtual de Anaconda que el proyecto requiere, y en `requirements.txt` estan las dependencias. El dataset utilizado está en `data/ventas_techventas.csv`

2. El proyecto se divide en 3 fases: 

    - Numpy & Fundamentos de Python, que se encuentra documentado en el notebook de Jupyter `01_numpy.ipynb`

    - SQL para exploración de datos (Data Discovery), presente en el notebook `02_sql_discovery.ipynb`, las queries utilizadas se encuentran en `sql/02_sql_discovery.sql`

    - Ingeniería de datos con Pandas, se encuentra en el notebook `03_pandas_pipeline.ipynb`, el data frame resultante se exporta a formato sql en `output/techventas.db`

## Problemas encontrados e inconvenientes durante el desarrollo del reto
Durante el desarrollo del ejercicio, me di cuenta que el dataset de techventas venía con una codificación distinta a la habitual utf-8, por lo que hice uso de herramientas como la librería de chardet para identificar la codificación que hacía falta usar para importar el csv a Pandas y Numpy, resultó ser latin-1, sin embargo el nombre de una de las vendedoras, Ana López tenía un error de codificación en el apellido que la herramienta identificó, y viendo que sin importar las variaciones de latin-1 que utilizara, el nombre seguía apareciendo de esta forma: Ana Lï¿½ï¿, y viendo que necesitaba utilizar este nombre para las consultas SQL, tomé la decisión de reemplazar el nombre con el error, por la versión correcta que aparece en el ejercicio, sin embargo, para futuros ejercicios me gustaría investigar más del tema de modo que pueda encontrar una solución más robusta y que no requiera esa sustitución manual.

Otro de los inconvenientes que me encontré, fueron las cantidades negativas de los pedidos, para las cuales mi primer impulso fue aplicarles valor absoluto para deshacerme de ellas y que no afectaran a los datos estadísticos de las primeras partes del reto, sin embargo, considerando un poco más a fondo la situación, decidí eliminar esa transformación, debido a que no correspondía con la etapa en la que estaba del ejercicio, y dado que al inicio se hace un entendimiento de los datos y del negocio, no era algo adecuado. Finalmente acabé filtrando ese registro junto con el registro del producto nulo para evitar los datos falsos. Aun así, para un próximo reto de igual forma me gustaría indagar un poco más en la imputación de datos, para aplicar dichos procesos por encima de la eliminación de registros.

## Estructura del proyecto
```text
├── .gitignore
├── README.md
├── requirements.txt
├── Reto 1 Descripción.pdf
├── setup.md
├── data/
│   └── ventas_techventas.csv
├── notebooks/
│   ├── 01_numpy_algebra.ipynb
│   ├── 02_sql_discovery.ipynb
│   └── 03_pandas_pipeline.ipynb
├── sql/
│   └── 02_sql_discovery.sql
├── images/
│   └── portada_README.png
└── output/
    └── techventas.db