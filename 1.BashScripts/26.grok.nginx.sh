For 404 Error Pattern:
%{IPORHOST:client_ip} - - %{NOTSPACE}%{SPACE}%{ISO8601_TIMEZONE}]%{SPACE}"%{WORD} /% 
{WORD} HTTP/%{NUMBER}" %{NUMBER:response_code}



For 403 Error Pattern:
%{IPORHOST:client_ip} - - %{NOTSPACE}%{SPACE}%{ISO8601_TIMEZONE}] "%{WORD} / HTTP/%
{NUMBER}" %{NUMBER:response_code}

echo '' | jq ".[].client_ip" -r | grep -i -v null
