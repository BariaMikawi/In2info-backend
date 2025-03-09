import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';

export default function Edit({ auth, products }) {
    return (
        <AuthenticatedLayout
            auth={auth}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Manage Products</h2>}
        >
            <Head title="Manage Products" />

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
                    <div className="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
                        <h3 className="text-lg font-semibold text-gray-900 dark:text-gray-100">Product List</h3>
                        <table className="min-w-full mt-4 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-700 rounded-lg">
                            <thead>
                                <tr className="border-b border-gray-300 dark:border-gray-700">
                                    <th className="p-3 text-left text-gray-800 dark:text-gray-200">ID</th>
                                    <th className="p-3 text-left text-gray-800 dark:text-gray-200">Name</th>
                                    <th className="p-3 text-left text-gray-800 dark:text-gray-200">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                {products.map((product) => (
                                    <tr key={product.id} className="border-b border-gray-300 dark:border-gray-700">
                                        <td className="p-3 text-gray-700 dark:text-gray-300">{product.id}</td>
                                        <td className="p-3 text-gray-700 dark:text-gray-300">{product.name}</td>
                                        <td className="p-3 text-gray-700 dark:text-gray-300">${product.price}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
