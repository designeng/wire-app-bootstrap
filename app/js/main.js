require(["wire", "wire!components/navtabs/navtabsSpec", "hasher"], function(wire, navtabsSpec, hasher) {
  return navtabsSpec.wire().then(function(resultCTX) {
    console.log("resultCTX::::", resultCTX);
    return hasher.init();
  });
});
