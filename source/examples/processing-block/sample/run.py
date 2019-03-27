"""
This is a sample processing block that always returns the input data.
"""
import json
import shutil

AOICLIPPED = "up42.data.aoiclipped"


def load_input():
    """
    Load the input data from the local filesystem
    """
    with open("/tmp/input/data.json") as fp:
        return json.loads(fp.read())


def run(data):
    for feature in data.get("features"):
        print("Found GeoJSON feature:\n%s" % feature)
        rel_image_path = feature["properties"].get(AOICLIPPED)
        image_path = "/tmp/input/%s" % rel_image_path
        print("Feature has an image at %s" % image_path)
        shutil.copy(image_path, '/tmp/output/')
    return data


def write_output(result):
    """
    Write the result data to the /tmp/output directory.

    If you are storing image data, you would need to then copy that data into this directory as well.
    """
    with open("/tmp/output/data.json", "w") as fp:
        fp.write(json.dumps(result))


if __name__ == "__main__":
    data = load_input()
    result = run(data)
    write_output(result)
