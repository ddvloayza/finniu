import logging
from django.contrib.auth import login
from django.contrib.auth.models import User
from django.views.generic import TemplateView, FormView, UpdateView, ListView
from django.contrib.auth.views import LoginView, LogoutView
from django.contrib.sites.shortcuts import get_current_site
from .forms import SignupForm, SetPasswordForm, RecuperaPasswordForm, SetPasswordFormMail, LoginForm
from apps.userprofile.models import UserProfile
from django.urls import reverse_lazy
from django.shortcuts import redirect, render
import json
from django.http import HttpResponse
from django.core import serializers
from django.http import JsonResponse



