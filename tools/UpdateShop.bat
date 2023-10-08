del ..\www\games.tfl
python UpdateHTML.py
python encrypt.py -k public.key -i games.json -o games.tfl
del games.json
move games.tfl ..\www\games.tfl