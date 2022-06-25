'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "a3932629661e70da2db9c6ac2a9f3c24",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/images/best-1.png": "cd248fc9c2a24534c49b8e009bb09e74",
"assets/images/best-2.png": "f85809855f641dedb8cdc017a3ec9409",
"assets/images/best-3.png": "4141fa50ff2d69cb3a13bc1ff67d9ee6",
"assets/images/detail-shade.png": "3ccb7970b1410116211d53cccd42631d",
"assets/images/gallery-1.png": "b609558554d4cf0771e62c0b28804d75",
"assets/images/gallery-2.png": "2f31bf52ac4c433c6951caf043da93bf",
"assets/images/gallery-3.png": "45338a23703200e5f0a91f28b037c807",
"assets/images/gallery-4.png": "d1d55e5d125e285ce6087b256cd5b288",
"assets/images/gallery-shade.png": "6e5f4f9ba2df8d1c5f36efd385febbb2",
"assets/images/icon-back.png": "ece428c527b911b46d701723dc1d4501",
"assets/images/icon-bath.png": "13ce7568825de154d4f2d37ff996885a",
"assets/images/icon-bed.png": "0c8af7a2b15d78b3cf538e3a4345df53",
"assets/images/icon-bookmark.png": "9777a5b6e80e38cf00402e3ba000da9c",
"assets/images/icon-bookmarked.png": "3ae456e2cf9fa3650b8b7fe0e9983494",
"assets/images/icon-filter.png": "6242ffd4af07ef5225cd7af97e197f72",
"assets/images/icon-location.png": "60c4da8ba527172338a463bb16e105a7",
"assets/images/icon-message.png": "3054dde0b37e16e9b1f98137cac19e87",
"assets/images/icon-notif.png": "72228c2aeaa2ce833ec733d8110f514e",
"assets/images/icon-phone.png": "302600fc6fedb66cb8f54d37a3b0e218",
"assets/images/icon-search.png": "07cdc6ef2075621fd4a23151759d7277",
"assets/images/lol.png": "e12c2bf7228f4597ffde4c80d6200ea0",
"assets/images/near-you-1.png": "7e044ec9ff7adbcff689b2aa304c78ea",
"assets/images/near-you-2.png": "5a9ec3aa57cd693178b131c701657ea4",
"assets/images/near-you-3.jpeg": "63ea241034aeb167d7e55ace66154c74",
"assets/images/near-you-shade.png": "e4905d3d09bbe39d97ef178828b82064",
"assets/images/splash-logo.png": "8eae7bc8e0f04eeeee16f6703c3849e6",
"assets/NOTICES": "1cf8cc93cff59091879dec9352771143",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "09f94ee734f905c216c998191327bec3",
"/": "09f94ee734f905c216c998191327bec3",
"main.dart.js": "8a2f43e168b81aea38b771226ceab77f",
"manifest.json": "8d6d41d335906a902a5edc7b486f0587",
"version.json": "cc6cbd83cdaf38e4ef449ab18aba98ca"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
