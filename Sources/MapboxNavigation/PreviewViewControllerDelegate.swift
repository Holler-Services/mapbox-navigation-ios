import UIKit
import CoreLocation
import MapboxDirections

// :nodoc:
public protocol PreviewViewControllerDelegate: AnyObject {
    
    func previewViewControllerWillPreviewRoutes(_ previewViewController: PreviewViewController)
    
    func previewViewControllerWillBeginNavigation(_ previewViewController: PreviewViewController)
    
    func previewViewController(_ previewViewController: PreviewViewController,
                               stateDidChangeTo state: PreviewViewController.State)
    
    func previewViewController(_ previewViewController: PreviewViewController,
                               didLongPressFor coordinates: [CLLocationCoordinate2D])
    
    func previewViewController(_ previewViewController: PreviewViewController,
                               didSelect route: Route)
    
    func destinationPreviewViewController(for previewViewController: PreviewViewController) -> DestinationableViewController?
    
    func routesPreviewViewController(for previewViewController: PreviewViewController) -> PreviewableViewController?
}
