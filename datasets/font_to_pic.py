import PIL
from PIL import ImageFont
from PIL import Image
from PIL import ImageDraw
import os
from os import path

b= 1040
folder = []
for i in os.walk(r'./test_fonts'): #папка со шрифтами
    folder.append(i) #добавление каждого файла в список folder
for address, dirs, files in folder: #цикл, охватывающий каждый файл
    for file in files:
        font = ImageFont.truetype(r'./test_fonts//' + str(file), 44) #переменной font присваивается шрифт размером 44 в пути указывается папка со шрифтами
        full_name = path.basename(r'./test_fonts//' + str(file)) #
        name = path.splitext(full_name)[0]                     # Вывод названия шрифта для возможной отладки в случае неполадок
        print(name)                                            #
        img = Image.new("RGBA", (64*32, 64), 'white') #создание пустой png картинки с белым фоном размерами (64*32)*64
        draw = ImageDraw.Draw(img) 
        x=0 #начальная координата x
        while b < 1072: #цикл печати символов, от А до Я;
            draw.text((x, 10), str(chr(b)), (0, 0, 0), font=font) # печать символа b по координатам (x;10) шрифтом font
            b+=1 #переход к следующему символу
            x+=64 #перемещение к следующему "квадрату"
        b=1040 #подготовка к следующему циклу печати
        img.save(r'./test//'+str(name)+'.0.0.png') #куда будут сохраняться буквы в разных шрифтах