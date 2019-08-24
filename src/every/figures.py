import matplotlib.pyplot as plt
import pandas as pd

data = pd.read_csv('data/people.csv')
data.plot.line(title='Students met per day since Fall 2019', ax=plt.gca())
plt.savefig('figs/people.png')
