from django.urls import path
from .views import test, send_blank

urlpatterns = [
    path('',                    send_blank, name='new'),
    path('login/',              test, name='login'),
    path('signup/',             test, name='signup'),
    path('question/<int:id>/',  test, name='question'),
    path('ask/',                test, name='ask'),
    path('popular/',            test, name='popular'),
    path('new/',                test, name='new'),
]