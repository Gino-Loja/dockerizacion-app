# 
FROM python:3.12

# 
WORKDIR /code

# 
COPY ./backend/requirements.txt /code/requirements.txt
COPY ./backend/get-pip.py /code/
RUN python get-pip.py
# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 
COPY ./backend /code/

# 
CMD ["uvicorn", "main:app","--reload", "--host", "0.0.0.0", "--port", "8000"]