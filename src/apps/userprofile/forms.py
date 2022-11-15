from django import forms
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.contrib.auth.forms import AuthenticationForm
from django.core.exceptions import ValidationError
from .models import UserProfile


class LoginForm(AuthenticationForm):


    def clean_username(self):
        print('entro1')
        email = self.cleaned_data['username'].strip()
        try:
           user = User.objects.get(username=email)
        except User.DoesNotExist:
            mensaje = u'El email no ha sido registrado'
            raise ValidationError(
                mensaje,
                code='email',
            )
        print('user', user)
        if not user.is_active:
            mensaje = 'Su cuenta no esta activa, por favor revise en su buzón (o Spam) el correo de activación.'
            raise ValidationError(
                mensaje,
                code='inactive',
            )
        return email

    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')

        if username is not None and password:
            self.user_cache = authenticate(self.request, username=username, password=password)
            print('self user cache', self.user_cache)

            if self.user_cache is None:
                raise self.get_invalid_login_error()
            else:
                self.confirm_login_allowed(self.user_cache)

        return self.cleaned_data

    def confirm_login_allowed(self, user):
        """
        Controls whether the given User may log in. This is a policy setting,
        independent of end-user authentication. This default behavior is to
        allow login by active users, and reject login by inactive users.
        If the given user cannot log in, this method should raise a
        ``ValidationError``.
        If the given user may log in, this method should return None.
        """
        if not user.is_active:
            raise ValidationError(
                self.error_messages['inactive'],
                code='inactive',
            )


class SignupForm(forms.Form):
    ''' Formulario de Registro '''
    nombres = forms.CharField(min_length=1, max_length=200)
    apellidos = forms.CharField(min_length=1, max_length=200)
    email = forms.EmailField(label='Email')
    password1 = forms.CharField(label='Contraseña', min_length=7, max_length=32)
    password2 = forms.CharField(label='Contraseña', min_length=7, max_length=32)
    accepted_policies = forms.BooleanField()
    accepted_data = forms.BooleanField(required=False)

    def clean_nombres(self):
        nombres = self.cleaned_data['nombres'].title().strip()
        return nombres

    def clean_apellidos(self):
        apellidos = self.cleaned_data['apellidos'].title().strip()
        return apellidos

    def clean_email(self):
        email = self.cleaned_data['email'].strip()
        domain = email.split('@')[1]
        universidad = Universidad.objects.first()
        domain_list = universidad.dominio
        if domain not in domain_list:
            raise forms.ValidationError("Por favor ingrese su correo institucional")

        try:
            User.objects.get(username=email)
            mensaje = (u'El email ya existe en nuestra base de datos')
            raise forms.ValidationError(mensaje)
        except User.DoesNotExist:
            return email

    def clean_password1(self):
        password1 = self.cleaned_data['password1']
        return password1

    def clean_password2(self):
        print('cleaned_data', self.cleaned_data)
        password1 = self.cleaned_data['password1']
        password2 = self.cleaned_data['password2']
        print ('password1',  password1)
        if (password1 == password2):
            password = password1
            print('entro')
        else:
            mensaje = (u'Las contraseñas no coinciden')
            raise forms.ValidationError(mensaje)
        return password

    def clean_accepted_policies(self):
        accepted = self.cleaned_data['accepted_policies']
        print ('acceptedd policies', accepted)
        if not accepted:
            mensaje = (u'Tienes que aceptar las políticas de privacidad para poder registarse')
            raise forms.ValidationError(mensaje)
        return accepted

    def save(self):
        print('save')
        cd = self.cleaned_data
        print ('cd', cd)
        user = User.objects.create_user(username=cd['email'], email=cd['email'], password=cd['password1'], is_active=False)
        user.last_name = cd['apellidos']
        user.first_name = cd['nombres']
        user.save()
        print('grabo')
        universidad = Universidad.objects.first()
        UserProfile.objects.create(user=user, universidad=universidad, accepted_policies=cd['accepted_policies'], accepted_data=cd['accepted_data'])
        return user


    def auth(self):
        cd = self.cleaned_data
        return authenticate(username=cd['email'], password=cd['password'])


class RecuperaPasswordForm(forms.Form):
    '''
        Formulario que solicita el email para iniciar el proceso de
        recuperación de contraseña.
    '''
    username = forms.EmailField(label='Email')

    def clean_username(self):
        username = self.cleaned_data['username']

        try:
            self.user = User.objects.get(username=username)
        except User.DoesNotExist:
            mensaje = 'El email no ha sido registrado'
            raise forms.ValidationError(mensaje)

        return username


class SetPasswordForm(forms.Form):
    '''
        Formulario que solicita la nueva contraseña
    '''
    user_id = forms.IntegerField()
    current_password = forms.CharField(min_length=7, max_length=32)
    new_password = forms.CharField(min_length=7, max_length=32)
    new_password_verification = forms.CharField(min_length=7, max_length=32)

    def clean_user_id(self):
        user_id = self.cleaned_data['user_id']
        if not User.objects.get(id=self.cleaned_data['user_id']):
            mensaje = 'El usuario no existe'
            raise forms.ValidationError(mensaje)
        return user_id
        print('probando_entrada')

    def clean_current_password(self):

        user = User.objects.get(id=self.cleaned_data['user_id'])

        password = self.cleaned_data['current_password']
        if not user.check_password(password):
            mensaje = 'La contraseña no coincide'
            raise forms.ValidationError(mensaje)

    def clean_new_password(self):
        new_password = self.cleaned_data['new_password']
        return new_password

    def clean_new_password_verification(self):
        print('nueva', self.cleaned_data['new_password'])
        print('nueva22', self.cleaned_data['new_password'])
        password_new = self.cleaned_data['new_password']
        new_password_verification = self.cleaned_data['new_password_verification']
        if password_new != new_password_verification:
            mensaje = 'Las contraseñas no son iguales'
            raise forms.ValidationError(mensaje)
        return new_password_verification

    def save(self):
        print('saving')
        cd = self.cleaned_data
        print ('cd', cd['user_id'])
        user = User.objects.get(pk=cd['user_id'])
        userpassword = cd['new_password']
        user.set_password(userpassword)
        print('user', user)
        user.save()
        print('grabo')
        return user


class SetPasswordFormMail(forms.Form):
    '''
        Formulario que solicita la nueva contraseña
    '''
    user_id = forms.IntegerField()
    new_password = forms.CharField(min_length=7, max_length=32)
    new_password_verification = forms.CharField(min_length=7, max_length=32)

    def clean_user_id(self):
        user_id = self.cleaned_data['user_id']
        if not User.objects.get(id=self.cleaned_data['user_id']):
            mensaje = 'El usuario no existe'
            raise forms.ValidationError(mensaje)
        return user_id
        print('probando_entrada')

    def clean_new_password(self):
        new_password = self.cleaned_data['new_password']
        return new_password

    def clean_new_password_verification(self):
        print('nueva', self.cleaned_data['new_password'])
        print('nueva22', self.cleaned_data['new_password'])
        password_new = self.cleaned_data['new_password']
        new_password_verification = self.cleaned_data['new_password_verification']
        if password_new != new_password_verification:
            mensaje = 'Las contraseñas no son iguales'
            raise forms.ValidationError(mensaje)

    def save(self):
        print('saving')
        cd = self.cleaned_data
        print ('cd', cd['user_id'])
        user = User.objects.get(pk=cd['user_id'])
        userpassword = cd['new_password']
        user.set_password(userpassword)
        print('user', user)
        user.save()
        print('grabo')
        return user
