from setuptools import setup, find_packages

VERSION = "1.2.0"


setup(
    name="pkt-docs",
    version=VERSION,
    url="https://github.com/pkt-cash/pkt-docs",
    license="MIT",
    author="PKT",
    packages=find_packages(),
    include_package_data=True,
    entry_points={
        "mkdocs.themes": [
            # "pkt = pkt",
            "moonstone = mkdocs_moonstone",
        ]
    },
    zip_safe=False,
)
