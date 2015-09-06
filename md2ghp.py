print "md2ghp"
# TODO
todo = [
    'locate DSS repo (or create if required)',
    'switch to DSS repo, identify current branch',
    'checkout gh-pages branch',
    'fetch and merge the gh-pages branch',
    'compare apiguide/ in gh-pages branch with locally build version in apiguild repo'
    'git rm as required',
    'clobber gh-pages md with locally built version',
    'commit differences, citing apiguide version in a way github can understand',
    "do not push! that is a manual task (or separate automation) - I think",
    'restpre DSS repo to as-you-found-it branch'
]
for task in todo:
    print "TODO: %s" % task

