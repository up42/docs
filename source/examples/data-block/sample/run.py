"""
This is a sample data block that always returns the same data, regardless of the query parameters being sent.
"""
import os
import json
import shutil

AOICLIPPED = "up42.data.aoiclipped"
TILES_DIR = "/block/tiles/"


def load_query():
    """
    Get the query for the current task
    """
    data = os.environ.get("UP42_TASK_PARAMETERS", '{}')
    print("Raw task params are: %s", data)
    query_data = json.loads(data)
    return query_data


def run(query):
    """
    Normally, in this example you would check the contents of the query and then fetch the data according to the
    filters specified. In this example, we will just return the sample data without filtering.
    """
    print("Processing query:\n%s" % query)

    output_data = {
        "type": "FeatureCollection",
        "features": [],
    }

    sample_files = [os.path.join(TILES_DIR, f) for f in os.listdir(TILES_DIR)]

    for file in sample_files:
        # The base filename of the json file, minus the extension
        tile_name = os.path.basename(file).split(".")[0]
        if file.endswith(".json"):
            features = json.loads(open(file).read()).get("features")
            # Add the image path as a capability to the feature(s) in the json data
            for f in features:
                f["properties"][AOICLIPPED] = tile_name + ".jpg"
            output_data["features"] += features
        else:
            shutil.copyfile(file, '/tmp/output/%s.jpg' % tile_name)

    return output_data


def write_output(result):
    """
    Write the result data to the /tmp/output directory.

    If you are storing image data, you would need to then copy that data into this directory as well.
    """
    with open("/tmp/output/data.json", "w") as fp:
        fp.write(json.dumps(result, indent=2))


if __name__ == "__main__":
    query = load_query()
    result = run(query)
    write_output(result)
