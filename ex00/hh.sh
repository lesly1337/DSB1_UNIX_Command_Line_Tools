#!/bin/bash
curl "https://api.hh.ru/vacancies?text=${1// /%20}&per_page=20" | jq '.items' > hh.json