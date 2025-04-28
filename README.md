### Инструкция для сборки приложения
1) git clone https://github.com/AleksandrNikolaev02/RASM.git
2) cd RASM
3) docker build -t rasm .
4) docker run --gpus all -v path/to/results:/app/results rasm
