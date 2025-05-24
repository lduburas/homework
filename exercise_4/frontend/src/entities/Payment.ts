export interface Payment {
    id?: number;
    date: Date;
    amount: number;
    currency: string;
    invoiceId: number;
}