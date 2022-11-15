from django.views.generic import TemplateView


class Error404View(TemplateView):
    template_name = "errors/404.html"
