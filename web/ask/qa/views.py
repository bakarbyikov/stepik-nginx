from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse 
from django.views.decorators.http import require_GET
from django.core.paginator import Paginator
from .models import *

def test(request, *args, **kwargs):
    return HttpResponse('OK')

def hello(request):
    return render(request, 'hello.html')

@require_GET
def new(request, page):
    QUESTIONS_ON_PAGE = 1

    question_list = Question.objects.new()
    paginator = Paginator(question_list, QUESTIONS_ON_PAGE)

    # page_number = request.GET.get('page')
    page_questions = paginator.get_page(page)
    return render(
        request, 
        'questions_list.html', 
        {'page_questions': page_questions}
        )

def question_details(request, id):
    question = get_object_or_404(Question, id=id)
    
    answers = question.answer_set.all().filter(question = question)
    return render(
        request, 
        'question_details.html', 
        {
            'question': question, 
            'answers': answers,
            }
        )