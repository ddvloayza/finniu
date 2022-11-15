from django import template
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth import authenticate
from apps.userprofile.forms import LoginForm
from django.contrib.auth import login as do_login
from django.contrib.auth.forms import AuthenticationForm


register = template.Library()


@register.inclusion_tag(
    'templatetags/__modal_login.html',
    takes_context=True
)
def login_form(context):

    request = context['request']
    form = AuthenticationForm()
    if request.method == "POST":
        print('entro')
        # Añadimos los datos recibidos al formulario
        form = AuthenticationForm(data=request.POST)
        # Si el formulario es válido...
        if form.is_valid():
            print('entro2')
            # Recuperamos las credenciales validadas
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            # Verificamos las credenciales del usuario
            user = authenticate(username=username, password=password)

            # Si existe un usuario con ese nombre y contraseña
            if user is not None:
                # Hacemos el login manualmente
                do_login(request, user)
                # Y le redireccionamos a la portada
    
    return {
        'form': form,
    }

