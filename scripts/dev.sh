bash ./scripts/watch.sh

firebase serve -o $(node -e "console.log('138.197.47.115 10.17.0.5'.split(' ')[0])") > /dev/null 2>&1 &
watching_ids="$watching_ids $!"

export watching_ids

