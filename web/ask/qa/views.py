from django.shortcuts import render
from django.http import HttpResponse 

def test(request, *args, **kwargs):
    return HttpResponse('OK')


def send_blank(request):
    return render(request, "blank_page.html")
