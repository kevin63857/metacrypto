coindesk(){
	close_or_ohlc="ohlc" #or ohlc or close
	#startdate="2010-07-17"
	startdate="2008-03-01"
	enddate=$(date "+%Y-%m-%d")
	exchange="$1" #bpi, or eth, or ltc
	if [[ "x${exchange}" == "x" ]]; then
		exchange="bpi"
	fi
	output="csv"  #also json
	curl "https://api.coindesk.com/charts/data?output=${output}&data=${close_or_ohlc}&index=USD&startdate=${startdate}&enddate=${enddate}&exchanges=${bpi}&dev=1" \
		-H 'Host: api.coindesk.com'  \
		-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0' \
		-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' \
		--compressed \
		-H 'Referer: https://www.coindesk.com/price/' \
		-o data/coindesk_${exchange}_${startdate}-${enddate}_${close_or_ohlc}.${output}

}

coindesk bpi
coindesk eth
coindesk ltc
