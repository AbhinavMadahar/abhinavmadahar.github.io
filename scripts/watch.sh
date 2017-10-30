# before watching, kill any existing watching processes
if [ "$watching_ids" != "${watching_ids/ /}" ]; then
	kill $watching_ids
fi

watching_ids=""

gulp watch > /dev/null 2>&1 &
pid=$!
watching_ids="$watching_ids $pid"

webpack --watch > /dev/null 2>&1 &
pid=$!
watching_ids="$watching_ids $pid"

export watching_ids

