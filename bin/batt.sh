if [ `batt --is-charged` -eq 1 ] ; then
    echo "⚡"
fi

if [ `batt --is-charging` -eq 1 ] ; then
    echo "⚡ `batt --time-to-full-charge`"
else
    echo "`batt --time-to-empty`"
fi

