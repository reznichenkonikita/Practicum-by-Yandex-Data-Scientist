# Выбор локации для скважины

## Цель и основные шаги работы

**Цель работы**: Необходимо построить модель машинного обучения, которая поможет определить регион с наибольшей прибылью от добычи. Также необходимо проанализировать возможную прибыль и риски техникой *Bootstrap*.

**Основные шаги работы**:
1. Загрузить и подготовить данные. Пояснить порядок действий;
1. Обучить и проверить модель для каждого региона;
1. Подготовить данные для рассчета прибыли;
1. Написать функцию для расчёта прибыли по выбранным скважинам и предсказаниям модели;
1. Посчитать риски и прибыль для каждого региона.

## Описание данных
**Признаки**
 * уникальный идентификатор скважины
 * три признака точек (неважно, что они означают, но сами признаки значимы)


**Целевой признак**
 * объём запасов в скважине (тыс. баррелей).
 
## Использумый стек
Python, pandas, numpy, matplotlib, sklearn

## Вывод
В результате проделанной рабоыт получили следующие результаты.

**1.)** Построили модели (линейная регрессия) для каждого региона и посчитали следующие значения метрик:
* R2;
* RMSE;
* mean.

Получили следующие результаты.

**Метрики**  | **Регион 1** | **Регион 2** | **Регион 3** |
:-------------: | :-------------: | :-------------: | :-------------: |
R2	 | 0.2799 | 0.9996 | 0.2052 |
RMSE | 37.5794 | 0.8931 | 40.0297 |
Mean target valid | 92.0786 | 68.7231 | 94.8842 |
Mean predict valid | 92.5926 | 68.7285 | 94.9650 |

* Средние значения объема запаса нефти в скважине на предсказанных и правильных значениях практически одинаковые для всех регионов;
* Среднее значение запаса нефти в скважине для 2-го региона примерно на **26% меньше**, чем для 1-го и 3-го регионов;
* Качество модели для 1-го и 3-го регионов намного хуже, чем для 2-го. Очень низкое значение коэффициента детерминации, которое показывает долю средней квадратичной ошибки модели от MSE среднего, а затем вычитает эту величину из единицы. Также большое значение метрики RMSE, которая показывает, как сильно правильный ответ отличается от предсказания;
* Идеальным получилась модель для 2-го региона с коэффициентом детерминации **R2= 0.9996 и RMSE= 0.8931**. Для этого региона модель практически идеально предсказывает все ответы.


**2.)** Рассчитали среднее значение запасов нефти для одной скважины для безубыточной разработки.
* Cреднее значение запасов нефти для одной скважины при безубыточной разработке должно быть не менее, чем 111.11;
* Во всех регионах средний запас нефти для одной скважины меньше, чем среднее значение запасов нефти для одной скважины при безубыточной разработке.

**3.)** Определили среднюю прибыль, 95% доверительный интервал, риски, используя технику Bootstrap c 1000 выборками.

Получили следующие результаты.

**Метрики**  | **Регион 1** | **Регион 2** | **Регион 3** |
:-------------: | :-------------: | :-------------: | :-------------: |
Средняя прибыль, млн.руб	 | 425.94 | 518.26 | 420.19 |
Риск, % | 6.0 | 0.3 | 6.2 |
95% доверительный интервал | (-102.09, 947.98) | (128.12, 953.61) | (-115.85, 989.63) |

* В результате можно сделать вывод, что **пригодным для разработки является 2-ой регион**, так как в этом регионе наименьшее **значение риска, которое составляет 0.3%**, а по условию это значение должно быть менее 2.5% и наибольшее **значение средней прибыли, которое составляет 518.26 млн.руб**.  
* Для 1-го и 3-го регионов значение рисоков слишком большое, которое составляет 6% и 6.2%, соответсвенно и не удовлетворяет условию задачи, так и средняя прибыли у этих регионов н априблизительно 20% меньше, чем у 2-го региона.

