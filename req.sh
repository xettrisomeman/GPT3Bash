#!/bin/bash


HEADER="Content-Type: application/json"
AUTHORIZATION="Authorization: Bearer $KEY"
OPENAI_URL="https://api.openai.com/v1/completions"
MODEL="text-davinci-002"
TEMPERATURE=0.7
MAX_TOKENS=256
TOP_P=1
FREQUENCY_PENALTY=0.0
PRESENCE_PENALTY=0.0


check_key() {
	if [ ${#KEY} -gt 0 ]
	then
		echo "key is set"
	else
		echo "key is not set"
	fi

}

send_request() {
	echo "sending request"
	CHOICES=$(curl -s -X POST -H "$HEADER" -H "$AUTHORIZATION" -d "{\"prompt\":\"$PROMPT\",\"model\":\"$MODEL\",\"temperature\":$TEMPERATURE,\"max_tokens\":$MAX_TOKENS,\"top_p\":$TOP_P,\"frequency_penalty\":$FREQUENCY_PENALTY,\"presence_penalty\":$PRESENCE_PENALTY}" $OPENAI_URL)
	echo "response: $CHOICES"
}


if check_key -eq "key is set"
then
	read -p "Enter prompt: " PROMPT
	send_request
fi









