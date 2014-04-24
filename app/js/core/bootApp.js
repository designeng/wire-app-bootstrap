define(["core/appinstance", "overridden"], function(App) {
  App.addInitializer(function(options) {
    console.log("App.addInitializer", options);
    if (!options.regionSelector) {
      throw new Error("Application region not specified!");
    }
    return App.addRegions({
      root: options.regionSelector,
      pageRegion: "#page"
    });
  });
  App.renderAsRoot = function(view) {
    return this.pageRegion.show(view);
  };
  return App;
});
