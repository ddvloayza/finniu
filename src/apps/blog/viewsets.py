from rest_framework import viewsets
from .models import BlogArticle
from .serializer import BlogArticleSerializer
from rest_framework.permissions import AllowAny
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.generics import ListAPIView


class BlogArticleViewsets(ListAPIView):
    queryset = BlogArticle.objects.all()
    serializer_class = BlogArticleSerializer
    permission_classes = [AllowAny]


class MethoVignereView(APIView):
    permission_classes = [AllowAny]
    serializer_class = BlogArticleSerializer

    def post(self, request):
        letras = ("ABCDEFGHIJKLMNÑOPQRSTUVWXYZ")
        mensaje = self.request.data.get('mensaje', "")
        accion = self.request.data.get('accion', "")
        array = []
        indice_clave = 0
        myKey = "MILLAVEPARAENCRIPTAR".upper()

        for symbol in mensaje:
            num = letras.find(symbol.upper())
            if num != -1:
                if accion == 'encriptar':
                    num += letras.find(myKey[indice_clave])
                elif accion == 'descifrar':
                    num -= letras.find(myKey[indice_clave])
                num %= len(letras)
                if symbol.isupper():
                    array.append(letras[num])
                elif symbol.islower():
                    array.append(letras[num].lower())
                indice_clave += 1
                if indice_clave == len(myKey):
                    indice_clave = 0

            else:
                array.append(symbol)
        return ('').join(array)
