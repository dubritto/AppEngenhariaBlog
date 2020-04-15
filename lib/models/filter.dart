enum OrderBy { DATE, LIKES }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class Filter {
  Filter({
    this.search,
    this.orderBy = OrderBy.DATE,
    this.minLikes,
    this.maxLikes,
    this.vendorType = VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL,
  });

  String search;
  OrderBy orderBy;
  int minLikes;
  int maxLikes;
  int vendorType;
}
