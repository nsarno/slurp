Slurp
=====

A ruby script to import and decode base64 images.

### Usage

```bash
$ gem install open-uri
$ gem install data_uri
```

```ruby
slurp 'http://myurl', ['image1', 'image2', 'image3']
```

- The default json key is `dataUri` but you can pass another key as an argument to the decode function.
- The default image extension is `.jpg` but you can pass another extension as an argument to the decode function.

### Example

I originally developed this script to fetch & decode images from [Earth View from Google Maps](https://chrome.google.com/webstore/detail/earth-view-from-google-ma/bhloflhklmhfpedakmangadcdofhnnoh).

You can run the script without changing it to run the example and get all the amazing Earth View from Google Maps images.

```bash
$ ./slurp.rb
```

![](.readme/slurp.png)
