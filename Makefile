build:
	mkdocs build

clean:
	rm dist/*.whl dist/*.tar.gz

cssmin: pkt/css/base.css pkt/css/bootstrap-custom.css pkt/css/pkt.css pkt/css/highlight.css
	uglifycss pkt/css/base.css > pkt/css/base.min.css
	uglifycss pkt/css/bootstrap-custom.css > pkt/css/bootstrap-custom.min.css
	uglifycss pkt/css/pkt.css > pkt/css/pkt.min.css
	uglifycss pkt/css/highlight.css > pkt/css/highlight.min.css

dist:
	python3 setup.py sdist bdist_wheel

push:
	twine upload dist/*.tar.gz dist/*.whl

serve:
	mkdocs serve

.PHONY: build clean cssmin dist serve
